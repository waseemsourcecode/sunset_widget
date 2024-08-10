//
//  sunset_widgetLiveActivity.swift
//  sunset_widget
//
//  Created by Waseem Siddiqi on 03/08/24.
//

import ActivityKit
import WidgetKit
import SwiftUI
//com.example.sunsetWidget.sunset-widget
//struct sunset_widgetAttributes: ActivityAttributes {
//    public struct ContentState: Codable, Hashable {
//        // Dynamic stateful properties about your activity go here!
//        var emoji: String
//    }
//
//    // Fixed non-changing properties about your activity go here!
//    var name: String
//}

 
// Data channel  <-  Must!
struct sunset_widgetAttributes: ActivityAttributes, Identifiable {
    public typealias LiveData = ContentState
   // public typealias LiveDeliveryData = ContentState
    public struct ContentState: Codable, Hashable {
        var data: [String: String]
    }

    var id = UUID()
}

let sharedDefault = UserDefaults(suiteName:"group.sunset11.liveactivity")! //"group.sunset11.liveactivity")!
//ScoreBoardWidgetLiveActivity
struct sunset_widgetLiveActivity: Widget {
    
    
    var body: some WidgetConfiguration {
            ActivityConfiguration(for: LiveActivitiesAppAttributes.self) { context in
              // let heading = sharedDefault.string(forKey: "heading")!
                let heading = sharedDefault.string(forKey: context.attributes.prefixedKey("heading"))!
               let subHeading = sharedDefault.string(forKey: context.attributes.prefixedKey("subheading"))!
//
                // Lock screen/banner UI goes here
                VStack {
                    Text(heading + " | " + subHeading)
                }.onAppear(perform: {
                    print("HELOoooo")
                })
                .activityBackgroundTint(Color.cyan)
                .activitySystemActionForegroundColor(Color.red)

            } dynamicIsland: { context in
              
                /**
                 'nameA': 'USA',
                   'scoreA': '123',
                   'imageA': lv,
                    'nameB': 'USA',
                   'scoreB': '123',
                   'imageB': lv,
                   "heading":"myheading",
                   "subheading":"subheading"
                 */
                return DynamicIsland {
                    DynamicIslandExpandedRegion(.leading) {
                    //    Text("leading")
                        VStack {
                           let t1Name = sharedDefault.string(forKey: context.attributes.prefixedKey( "nameA"))!
//                            if let t1Image = sharedDefault.string(forKey: context.attributes.prefixedKey( "imageA")), // <-- Put your key here
//                              let uiImage = UIImage(contentsOfFile: t1Image) {
//                              Image(uiImage: uiImage)
//                                  .resizable()
//                                  .frame(width: 53, height: 53)
//                                  .cornerRadius(13)
//                            }
                            Text(t1Name)
                                .font(.subheadline)
                        }
                    }
                    DynamicIslandExpandedRegion(.trailing) {
                        VStack {
                           let t2Name = sharedDefault.string(forKey: context.attributes.prefixedKey( "nameB"))!
//                            if let t2Image = sharedDefault.string(forKey: context.attributes.prefixedKey( "imageB")), // <-- Put your key here
//                              let uiImage = UIImage(contentsOfFile: t2Image) {
//                              Image(uiImage: uiImage)
//                                  .resizable()
//                                  .frame(width: 53, height: 53)
//                                  .cornerRadius(13)
//                            }
                            Text(t2Name)
                                .font(.subheadline)
                        }
                       // Text("Trailing")
                    }
                    DynamicIslandExpandedRegion(.bottom) {
                        VStack {
//                            let t1Score = sharedDefault.string(forKey: context.attributes.prefixedKey( "scoreA"))!
//                            let t2Score = sharedDefault.string(forKey: context.attributes.prefixedKey( "scoreB"))!
//                            let time = sharedDefault.string(forKey: context.attributes.prefixedKey(  "scoreA"))!
//                            
                            Text("t1Score" + " : " + "t2Score")
                                .font(.largeTitle)
                                .fontWeight(.black)
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 100, height: 36)
                                
                                Text("time")
                                    .font(.body)
                                    .foregroundColor(.white)
                                
                            }
                        }
                       
                    }
                } compactLeading: {
                    
                    HStack {
//                        let t1Score = sharedDefault.string(forKey: context.attributes.prefixedKey( "scoreB"))!
//                        if let t1Image = sharedDefault.string(forKey: context.attributes.prefixedKey(  "imageB")), // <-- Put your key here
//                          let uiImage = UIImage(contentsOfFile: t1Image) {
//                          Image(uiImage: uiImage)
//                              .resizable()
//                              .frame(width: 30, height: 30)
//                        }
                        Text("t1Score")
                    }
                } compactTrailing: {
                   
                    HStack {
                       // let t2Score = sharedDefault.string(forKey: context.attributes.prefixedKey( "scoreB"))!
                        Text("t2Score")
                        
//                        if let t2Image = sharedDefault.string(forKey: context.attributes.prefixedKey( "imageB")), // <-- Put your key here
//                          let uiImage = UIImage(contentsOfFile: t2Image) {
//                          Image(uiImage: uiImage)
//                              .resizable()
//                              .frame(width: 30, height: 30)
//                        }
                    }
                } minimal: {
                    Text("Min")
                }
               // .widgetURL(URL(string:"http://www.apple.com"))
                .keylineTint(Color.red)
            }
        }
    }
