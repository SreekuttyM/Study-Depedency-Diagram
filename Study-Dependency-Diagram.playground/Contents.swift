import UIKit

protocol FeedLoader {
    func loadFeed(completion : @escaping (([String]) -> Void))
}

class FeedViewController : UIViewController {
    var loader : FeedLoader!
    var remoteLoader : RemoteFeedLoader!
    var localLoader : LocalFeedLoader!

    convenience init(remoteLoader :RemoteFeedLoader, localLoader : LocalFeedLoader) {
        self.init()
        self.remoteLoader = remoteLoader
        self.localLoader = localLoader

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //if internet connection
        remoteLoader.loadFeed { loadItems in
        }
    //} else {
        localLoader.loadFeed { loadItems in
        }
    //}
    }
}

class RemoteFeedLoader : FeedLoader { //from api
    func loadFeed(completion:@escaping (([String]) -> Void)) {
    
    }
}


class LocalFeedLoader : FeedLoader {//fecth from predefined json in bundle or local cache
    func loadFeed(completion:@escaping (([String]) -> Void)) {
        
    }
}


    
