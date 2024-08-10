import UIKit
import Flutter 






@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      // Register Flutter channels, specifically for Live Activities
//             let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
//             LiveActivitiesManager.register(controller: controller)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

//struct GroceryDeliveryAppAttributes: ActivityAttributes {
//    public typealias LiveDeliveryData = ContentState
//
//    public struct ContentState: Codable, Hashable {
//        var courierName: String
//        var deliveryTime: Date
//    }
//    var numberOfGroceyItems: Int
//}
//
//struct LiveActivitiesAppAttributes: ActivityAttributes, Identifiable {
//  public typealias LiveDeliveryData = ContentState // don't forget to add this line, otherwise, live activity will not display it.
//
//  public struct ContentState: Codable, Hashable { }
//
//  var id = UUID()
//}
//
//extension LiveActivitiesAppAttributes {
//  func prefixedKey(_ key: String) -> String {
//    return "\(id)_\(key)"
//  }
//}
//
//
//// Create shared default with custom group
//let sharedDefault = UserDefaults(suiteName: "group.sunset11.liveactivity")!
//@available(iOSApplicationExtension 16.1, *)
//struct GroceryDeliveryApp: Widget {
//    
//    @available(iOS 14.0, *)
//    var body: some WidgetConfiguration {
//        ActivityConfiguration(for: GroceryDeliveryAppAttributes.self) { context in
//            LockScreenView(context: context)
//        } dynamicIsland: { context in
//            DynamicIsland {
//                DynamicIslandExpandedRegion(.leading) {
//                    dynamicIslandExpandedLeadingView(context: context)
//                 }
//                 
//                 DynamicIslandExpandedRegion(.trailing) {
//                     dynamicIslandExpandedTrailingView(context: context)
//                 }
//                 
//                 DynamicIslandExpandedRegion(.center) {
//                     dynamicIslandExpandedCenterView(context: context)
//                 }
//                 
//                DynamicIslandExpandedRegion(.bottom) {
//                    dynamicIslandExpandedBottomView(context: context)
//                }
//                
//              } compactLeading: {
//                  compactLeadingView(context: context)
//              } compactTrailing: {
//                  compactTrailingView(context: context)
//              } minimal: {
//                  minimalView(context: context)
//              }
//              .keylineTint(.cyan)
//        }
//    }
//    
//    
//    //MARK: Expanded Views
//    func dynamicIslandExpandedLeadingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
//        VStack {
//            Label {
//                Text("\(context.attributes.numberOfGroceyItems)")
//                    .font(.title2)
//            } icon: {
//                Image("grocery")
//                    .foregroundColor(.green)
//            }
//            Text("items")
//                .font(.title2)
//        }
//    }
//    
//    func dynamicIslandExpandedTrailingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
//        Label {
//            Text(context.state.deliveryTime, style: .timer)
//                .multilineTextAlignment(.trailing)
//                .frame(width: 50)
//                .monospacedDigit()
//        } icon: {
//            Image(systemName: "timer")
//                .foregroundColor(.green)
//        }
//        .font(.title2)
//    }
//    
//    func dynamicIslandExpandedBottomView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
//         let urlInner = URL(string: "sus://my.app/order?=123")!
//        
//        let url = URL(string: "LiveActivities://?CourierNumber=87987")
//        return Link(destination: urlInner) {
//            Label("Call courier", systemImage: "phone")
//        }.foregroundColor(.green)
//    }
//    
//    func dynamicIslandExpandedCenterView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
//        Text("\(context.state.courierName) is on the way!")
//            .lineLimit(1)
//            .font(.caption)
//    }
//    
//    
//    //MARK: Compact Views
//    func compactLeadingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
//        VStack {
//            Label {
//                Text("\(context.attributes.numberOfGroceyItems) items")
//            } icon: {
//                Image("grocery")
//                    .foregroundColor(.green)
//            }
//            .font(.caption2)
//        }
//    }
//    
//    func compactTrailingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
//        Text(context.state.deliveryTime, style: .timer)
//            .multilineTextAlignment(.center)
//            .frame(width: 40)
//            .font(.caption2)
//    }
//    
//    func minimalView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
//        VStack(alignment: .center) {
//            Image(systemName: "timer")
//            Text(context.state.deliveryTime, style: .timer)
//                .multilineTextAlignment(.center)
//                .monospacedDigit()
//                .font(.caption2)
//        }
//    }
//}
//
//
//
//
//
//@available(iOSApplicationExtension 16.1, *)
//struct LockScreenView: View {
//    var context: ActivityViewContext<GroceryDeliveryAppAttributes>
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                VStack(alignment: .center) {
//                    Text(context.state.courierName + " is on the way!").font(.headline)
//                    Text("You ordered \(context.attributes.numberOfGroceyItems) grocery items.")
//                        .font(.subheadline)
//                    BottomLineView(time: context.state.deliveryTime)
//                }
//            }
//        }.padding(15)
//    }
//}
//
//struct BottomLineView: View {
//    var time: Date
//    var body: some View {
//        HStack {
//            Divider().frame(width: 50,
//                            height: 10)
//            .overlay(.gray).cornerRadius(5)
//            Image("delivery")
//            VStack {
//                RoundedRectangle(cornerRadius: 5)
//                    .stroke(style: StrokeStyle(lineWidth: 1,
//                                               dash: [4]))
//                    .frame(height: 10)
//                    .overlay(Text(time, style: .timer).font(.system(size: 8)).multilineTextAlignment(.center))
//            }
//            Image("home-address")
//        }
//    }
//}
