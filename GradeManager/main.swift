import Foundation

let inputManager: InputManager = InputManager()
let menuManager: MenuManager = MenuManager(inputManager: inputManager)
while menuManager.run() {
    print()
}
