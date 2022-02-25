import UIKit
protocol FeedLoader {
    func loadFeed(completion :(([String]) -> Void))
}
class FeedViewController : UIViewController {
    var loader : FeedLoader!
    
    convenience init(loader :FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.loadFeed { loadItems in
            
        }
    }
}
