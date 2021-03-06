# ios-ipfs-api

A wrapper of the IPFS Client HTTP-API for iOS.

[![CI Status](https://img.shields.io/travis/com/kjaylee/ios-ipfs-api.svg?style=popout)](https://travis-ci.com/kjaylee/ios-ipfs-api)
[![Version](https://img.shields.io/cocoapods/v/IpfsApi.svg?style=popout)](https://cocoapods.org/pods/IpfsApi)
[![License](https://img.shields.io/cocoapods/l/IpfsApi.svg?style=popout)](https://cocoapods.org/pods/IpfsApi)
[![Platform](https://img.shields.io/cocoapods/p/IpfsApi.svg?style=popout)](https://cocoapods.org/pods/IpfsApi)

Check out [the client API reference](https://ipfs.io/docs/api/) for the full command reference. 

## TODO

- [ ] test case.
- [ ] support OSX.
- [x] example app.
- [x] support carthage.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

[![iOS example](http://img.youtube.com/vi/Mh9OITAbNhY/0.jpg)](https://www.youtube.com/watch?v=Mh9OITAbNhY "iOS example")


```swift
    import Ipfs
    
    
    //Default base address: "http://127.0.0.1:5001/api/v0"
    
    //Do nothing...
    //Or
    Ipfs.shared().setBase(address: "http://your.ipfs.address")
    //Or
    Ipfs.shared().setBase(address: "http://your.ipfs.address", port: 5001)
    //Or
    Ipfs.shared().setBase(address: "http://your.ipfs.address", port: 5001, apiVersionPath: "/api/v0")
    
```

```swift
    import Ipfs
    import Moya
    
    // /swarm/peers
    Ipfs.swarm.peers { (result) in
        switch result {
        case let .success(moyaResponse):
            let data = moyaResponse.data
            let statusCode = moyaResponse.statusCode
            // do something with the response data or statusCode
            print("statusCode: \(statusCode)")
            print("result: \(data)")
            break
        case let .failure(error):
            // this means there was a network failure - either the request
            // wasn't sent (connectivity), or no response was received (server
            // timed out).  If the server responds with a 4xx or 5xx error, that
            // will be sent as a ".success"-ful response.
            print("failure: \(error.localizedDescription)")
            break
        }
    }
    
```

```swift
    import Ipfs
    import Moya //pod 'Moya/RxSwift'
    import RxSwift
    
    let service = IAService.swarmPeers(arguments: nil)
    let queue = DispatchQueue(label: service.path, qos: .utility, attributes: [.concurrent])
    Ipfs.shared().rx.request(MultiTarget(service), callbackQueue: queue)
        .filterSuccessfulStatusCodes()
        .map(ResponseSwarmPeersModel.self)
        .subscribe(onSuccess: { (model) in
            print("model count: \(model.peers?.count ?? 0)")
            print("model peers: \(String(describing: model.peers ?? nil))")
        }) { (error) in
        print("failure: \(error.localizedDescription)")
    }.disposed(by: disposeBag)
    
```

## Requirements

- iOS 8.0+
- Xcode 9.3+
- Swift 4.1+


## Installation

IpfsApi is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'IpfsApi'
```


## Test environment setup

### Docker usage(https://github.com/ipfs/go-ipfs)

An IPFS docker image is hosted at [hub.docker.com/r/ipfs/go-ipfs](https://hub.docker.com/r/ipfs/go-ipfs/).
To make files visible inside the container you need to mount a host directory
with the `-v` option to docker. Choose a directory that you want to use to
import/export files from IPFS. You should also choose a directory to store
IPFS files that will persist when you restart the container.

    export ipfs_staging=</absolute/path/to/somewhere/>
    export ipfs_data=</absolute/path/to/somewhere_else/>

Start a container running ipfs and expose ports 4001, 5001 and 8080:

    docker run -d --name ipfs_host -v $ipfs_staging:/export -v \
        $ipfs_data:/data/ipfs -p 4001:4001 -p 127.0.0.1:8080:8080 \
        -p 127.0.0.1:5001:5001 ipfs/go-ipfs:latest

Watch the ipfs log:

    docker logs -f ipfs_host

Wait for ipfs to start. ipfs is running when you see:

    Gateway (readonly) server
    listening on /ip4/0.0.0.0/tcp/8080

You can now stop watching the log.

Run ipfs commands:

    docker exec ipfs_host ipfs <args...>

For example: connect to peers

    docker exec ipfs_host ipfs swarm peers

Add files:

    cp -r <something> $ipfs_staging
    docker exec ipfs_host ipfs add -r /export/<something>

Stop the running container:

    docker stop ipfs_host


## Author

kjaylee, k.jaylee@gmail.com

## License

IpfsApi is available under the MIT license. See the LICENSE file for more info.
