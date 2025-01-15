//
//  Persistence.swift
//  Landmarks
//
//  Created by 황준성 on 1/13/25.
//

import CoreData

//CoreData 관리 구조체
struct PersistenceController {
    static let shared = PersistenceController()

    //CoreData 초기화 및 설정
    @MainActor
    //메인 스레드에서 작업
    static let preview: PersistenceController = {
        //메모리 전용 데이터 저장 및 프리뷰 제공
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            //임시로 10개의 현재시간 저장
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    //데이터 모델, 영구 컨테이너
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Landmarks")
        if inMemory {
            //데이터를 파일이 아닌 메모리에 저장
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null") //가상의 저장소, 저장하지 않음.
        }
        //데이터 로드
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
