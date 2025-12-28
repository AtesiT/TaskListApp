import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //  Класс Window отвечает за окна, в которых размещаются различные ViewControllers
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //  На строчке ниже происходит создание сцены.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        //  Настравиваем стартовый ViewController
        window = UIWindow(windowScene: windowScene)
        //  Делаем ключевым окно и видимым
        window?.makeKeyAndVisible()
        //  Определяем стартовый VC, с которого запускается приложение
        window?.rootViewController = TaskListViewController()
        
    }

    //  Этот последний метод вызывается, когда приложение уходит в фоновый режим и в этот момент необходимо сделать сохранение в базе данных
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

