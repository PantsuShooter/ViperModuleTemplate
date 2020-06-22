//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Swinject
import SwinjectStoryboard

final class ___VARIABLE_moduleName___AssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(___VARIABLE_moduleName___ModuleInteractor.self) { (r, presenter: ___VARIABLE_moduleName___ModulePresenter) in
            let interactor = ___VARIABLE_moduleName___ModuleInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(___VARIABLE_moduleName___ModuleRouter.self) { (r, viewController: ___VARIABLE_moduleName___ModuleView) in
            let router = ___VARIABLE_moduleName___ModuleRouter()
            router.transitionHandler = viewController
            
            return router
        }
        
        container.register(___VARIABLE_moduleName___ModulePresenter.self) { (r, viewController: ___VARIABLE_moduleName___ModuleView) in
            let presenter = ___VARIABLE_moduleName___ModulePresenter()
            presenter.view          = viewController
            presenter.interactor    = r.resolve(___VARIABLE_moduleName___ModuleInteractor.self, argument: presenter)
            presenter.router        = r.resolve(___VARIABLE_moduleName___ModuleRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.storyboardInitCompleted(___VARIABLE_moduleName___ModuleView.self) { r, viewController in
            viewController.output = r.resolve(___VARIABLE_moduleName___ModulePresenter.self, argument: viewController)
        }
    }
}
