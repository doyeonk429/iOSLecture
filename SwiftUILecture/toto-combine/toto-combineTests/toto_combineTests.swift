//
//  toto_combineTests.swift
//  toto-combineTests
//
//  Created by 김도연 on 4/4/25.
//

import Testing
@testable import toto_combine

struct toto_combineTests {
    struct DefaultNetworkService: NetworkService {}

    var service: NetworkService {
        LoggingNetworkService(wrapped: DefaultNetworkService(), enableFileLogging: true)
    }
    
    func logStart(of name: String = #function) {
        FileLogger.log("----- 🧪 [\(name)] 시작 -----")
    }
    func logEnd(of name: String = #function) {
        FileLogger.log("----- ✅ [\(name)] 종료 -----")
    }

    @Test
    func testGetPosts() async throws {
        logStart()
        print("📁 로그 파일 위치: \(FileLogger.logFileURL.path)")
        
        let posts: [Post] = try await service.request(PostAPI.getPosts, responseType: [Post].self)
        #expect(!posts.isEmpty, "❌ 게시글이 비어 있습니다. 서버가 꺼져있거나, 파싱 실패 가능성")
        logEnd()
    }

    @Test
    func testCreatePost() async throws {
        logStart()
        do {
            let newPost: Post = try await service.request(
                PostAPI.createPost(title: "Hello", body: "world", userId: 1),
                responseType: Post.self
            )
            #expect(newPost.id == 101, "❌ 예상한 ID(101)가 아닙니다. 응답: \(newPost)")
        } catch {
            #expect(false, "❌ POST 요청 실패: \(error.localizedDescription)")
        }
        logEnd()
    }

    @Test
    func testUpdatePost() async throws {
        logStart()
        do {
            let updated = try await service.request(
                PostAPI.updatePost(id: 1, title: "Updated Title", body: "Updated body", userId: 1),
                responseType: Post.self
            )
            #expect(updated.title == "Updated Title", "❌ 제목이 업데이트되지 않았습니다. 응답: \(updated)")
            #expect(updated.id == 1, "❌ 업데이트된 ID가 1이 아닙니다. 응답: \(updated.id)")
        } catch {
            #expect(false, "❌ PUT 요청 실패: \(error.localizedDescription)")
        }
        logEnd()
    }

    @Test
    func testPatchPost() async throws {
        logStart()
        do {
            let patched = try await service.request(
                PostAPI.patchPost(id: 1, title: "Patched Title"),
                responseType: Post.self
            )
            #expect(patched.title == "Patched Title", "❌ 제목이 패치되지 않았습니다. 응답: \(patched)")
            #expect(patched.id == 1, "❌ 패치된 ID가 1이 아닙니다. 응답: \(patched.id)")
        } catch {
            #expect(false, "❌ PATCH 요청 실패: \(error.localizedDescription)")
        }
        logEnd()
    }

    @Test
    func testDeletePost() async throws {
        logStart()
        do {
            let _: EmptyResponse = try await service.request(
                PostAPI.deletePost(id: 1),
                responseType: EmptyResponse.self
            )
            #expect(true, "✅ DELETE 요청 성공 (응답 없음)")
        } catch {
            #expect(false, "❌ DELETE 요청 실패: \(error.localizedDescription)")
        }
        logEnd()
    }

}
