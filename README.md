# CoordinatorPattern

An **iOS UIKit** sample that illustrates the *Coordinator Pattern*: a lightweight architecture for handling navigation logic outside view controllers. The goal is to keep your `UIViewController`s lean, improve re‑usability, and make deep‑linking or onboarding flows trivially swappable. ([medium.com](https://medium.com/%40maysam.shahsavari/a-comprehensive-guide-to-coordinator-pattern-in-swift-7e7647ecc525?utm_source=chatgpt.com), [hackingwithswift.com](https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps?utm_source=chatgpt.com))

---

## Project Overview

This repo contains a single‑target Xcode project (`CoordinatorPattern.xcodeproj`) built with **Swift 5.10** and **Xcode 15.3**. It ships a minimal three‑screen example:

```
AppCoordinator (root)
├─ AuthCoordinator
│  └─ LoginViewController
└─ HomeCoordinator (tab bar)
   ├─ FeedViewController
   └─ SettingsViewController
```

### Coordinators

| File                    | Responsibility                                                                                                     |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `Coordinator.swift`     | Base protocol: every coordinator owns a `UINavigationController` (or `UITabBarController`) and a `start()` method. |
| `AppCoordinator.swift`  | Kicks off either **Auth** or **Home** flows depending on a fake `isLoggedIn` flag.                                 |
| `AuthCoordinator.swift` | Presents the login screen and notifies the `AppCoordinator` on success.                                            |
| `HomeCoordinator.swift` | Hosts a tab‑bar with *Feed* and *Settings* scenes.                                                                 |

### Scenes

`FeedViewController`, `SettingsViewController`, and `LoginViewController` are deliberately dumb—they expose callbacks so that their parent coordinator decides where to go next.

## How It Works

1. **SceneDelegate** instantiates `AppCoordinator` and sets its `navigationController` as the `window.rootViewController`.
2. `AppCoordinator.start()` decides which child coordinator to launch.
3. Child coordinators push/present view controllers and emit **completion closures** back to the parent.
4. Each coordinator holds **strong references** to its children to keep them alive; once a child finishes, the parent removes it so ARC can clean up.

```swift
protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    func start()
}
```
## License

This sample is released under the MIT License. See `LICENSE` for full text.
