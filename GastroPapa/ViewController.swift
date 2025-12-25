// ViewController.swift
import UIKit

class ViewController: UIViewController {
    
    let menuService = MenuDataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("🔍 Начинаю тестирование сервиса...")
        testMenuService()
    }
    
    func testMenuService() {
        // 1. Загружаем данные
        let categories = menuService.loadMenu()
        
        // 2. Проверяем, что что-то загрузилось
        if categories.isEmpty {
            print("❌ ОШИБКА: Ничего не загрузилось!")
            return
        }
        
        print("✅ Успешно загружено категорий: \(categories.count)")
        
        // 3. Проверяем первую категорию
        let firstCategory = categories[0]
        print("📋 Первая категория: \(firstCategory.name)")
        print("   ID: \(firstCategory.id)")
        print("   Блюд в категории: \(firstCategory.dishes.count)")
        
        // 4. Проверяем первое блюдо
        if let firstDish = firstCategory.dishes.first {
            print("🍽️ Первое блюдо: \(firstDish.name)")
            print("   ID: \(firstDish.id)")
            print("   Цена: \(firstDish.price)")
            print("   Описание: \(firstDish.description)")
            print("   Имя картинки: \(firstDish.imageName)")
            
            // 5. Проверяем, что картинка существует
            if UIImage(named: firstDish.imageName) != nil {
                print("   🖼️ Картинка найдена в Assets!")
            } else {
                print("   ⚠️ Картинка '\(firstDish.imageName)' НЕ найдена в Assets!")
            }
        }
        
        // 6. Выводим статистику по всем категориям
        print("\n📊 СТАТИСТИКА ПО КАТЕГОРИЯМ:")
        for (index, category) in categories.enumerated() {
            print("   \(index + 1). \(category.name): \(category.dishes.count) блюд")
        }
        
        // 7. Подсчитываем общее количество блюд
        let totalDishes = categories.reduce(0) { $0 + $1.dishes.count }
        print("\n🍴 ВСЕГО БЛЮД: \(totalDishes)")
        
        // 8. Проверяем уникальность ID блюд
        checkUniqueDishIDs(categories: categories)
    }
    
    func checkUniqueDishIDs(categories: [MenuCategoryModel]) {
        var allIDs: Set<Int> = []
        var duplicateIDs: [Int] = []
        
        for category in categories {
            for dish in category.dishes {
                if allIDs.contains(dish.id) {
                    duplicateIDs.append(dish.id)
                }
                allIDs.insert(dish.id)
            }
        }
        
        if duplicateIDs.isEmpty {
            print("✅ Все ID блюд уникальны")
        } else {
            print("❌ Найдены дубликаты ID: \(duplicateIDs)")
        }
    }
}
