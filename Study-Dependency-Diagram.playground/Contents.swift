import UIKit

protocol FeedLoader {
    func loadFeed(completion : @escaping (([String]) -> Void))
}

class FeedViewController : UIViewController {
    var loader : RemoteWithLocalFallBackFeedLoader!
    override func viewDidLoad() {
        super.viewDidLoad()
       //if internet connection
        loader.loadFeed { feedItem in
            
        }
    }
}

class RemoteFeedLoader : FeedLoader { //from api
    func loadFeed(completion:@escaping (([String]) -> Void)) {
    //afnetworking/urlsession call
    }
}

class LocalFeedLoader : FeedLoader {//fecth from predefined json in bundle or local cache
    func loadFeed(completion:@escaping (([String]) -> Void)) {
        //sqlite,db,or nibfile json
    }
}


class RemoteWithLocalFallBackFeedLoader : FeedLoader {
   
    //fecth from predefined json in bundle or local cache
    let remoteFeedLoader : RemoteFeedLoader
    let localFeedLoader : LocalFeedLoader

    init(remoteFeedLoader:RemoteFeedLoader,localFeedLoader :LocalFeedLoader) {
        self.remoteFeedLoader = remoteFeedLoader
        self.localFeedLoader = localFeedLoader
    }
    func loadFeed(completion: @escaping (([String]) -> Void)) {
        let networkavailableIsTrue = false
        let load = networkavailableIsTrue ? remoteFeedLoader.loadFeed : localFeedLoader.loadFeed
        load(completion)
    }
   
}
    
