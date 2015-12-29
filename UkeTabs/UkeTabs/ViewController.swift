//
//  ViewController.swift
//  UkeTabs
//
//  Created by Seongmin on 12/6/15.
//  Copyright © 2015 Seongmin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data = ["C","D","E","F","G","A","B",
                "Cm","Dm","Em","Fm","Gm","Am","Bm",
                "C7","D7","E7","F7","G7","A7","B7",
                "Cmaj7","Dmaj7","Emaj7","Fmaj7","Gmaj7","Amaj7","Bmaj7",
                "Cm7","Dm7","Em7","Fm7","Gm7","Am7","Bm7"]
    var taps: [Tap] = []
    var registeredTaps: [String:Bool] = [:]
    
    let textCellIdentifier = "TextCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "didTap:")
        imageView.addGestureRecognizer(tapRecognizer)
        textLabel.text = "Ukulele Chords"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetPressed(sender: UIButton) {
        resetImageView()
    }
    
    @IBAction func donePressed(sender: UIButton) {
        print("currentFingering: " + getCurrFingering())
        guess()
    }
    
    @IBAction func undoPressed(sender: UIButton) {
        removeLastTap()
    }
    
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var textLabel: UILabel!
   
    // Mandatory tableview methods:
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return data.count
        return 35
    }
    
    // Initializing individual cells.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = data[row]
        
        return cell
    }
    
    // User tab action.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        textLabel.text = data[row]
        resetImageView()
        let fingering = findFingering(data[row])
        drawFingering(fingering!)
    }
    
    // Tap Listner's callback.
    func didTap(tapRecog: UITapGestureRecognizer) {
        let tapLocation = tapRecog.locationInView(imageView)
        let tap = Tap(location: tapLocation, parentView: imageView)
        addTap(tap)
    }
    
    // Register a tap.
    func addTap(tap: Tap) {
        let key = tap.key
        // Tap is deleted:
        if (registeredTaps[key] == true) {
            let newTap = findDuplicate(key)!
            newTap.removeTap()
            taps.removeAtIndex(taps.indexOf({$0 === newTap})!)
            registeredTaps[key] = false
        // Tap is drawn:
        } else {
            tap.drawDot()
            registerTap(tap)
        }
    }
    
    // Deregister a tap.
    func removeLastTap() {
        if (taps.isEmpty) { return }
        let tap = taps.popLast()!
        // Update 2d array of registered taps.
        let key: String = String(tap.row) + String(tap.col)
        registeredTaps[key] = false
        // Remove from UI.
        tap.removeTap()
    }
    
    func findDuplicate(keyInfo: String) -> Tap? {
        for tap in taps {
            if (tap.key == keyInfo) { return tap }
        } // No need for else here.
        return nil
    }
    
    func guess() {
        let currFingering = getCurrFingering()
        let fingering = Fingering.isValid(currFingering)
        if (fingering != "None") {
            textLabel.text = fingering;
        } else {
            textLabel.text = "No such tab :("
        }
    }
    
    func getCurrFingering() -> String {
        var extracted = ""
        for i in 0...3 {
            for j in 0...3 {
                let key = String(i) + String(j)
                if (registeredTaps[key] == true) {
                    extracted += toIndex(i,col: j)
                }
            }
        }
        return extracted
    }
    
    func toIndex(row: Int, col: Int) -> String {
        return String(row * 4 + col)
    }
    
    func drawFingering(fingering: Fingering) {
        for index in fingering.indices {
            let tap = indexToTap(index)
            registerTap(tap)
            tap.drawDot()
        }
    }
    
    func indexToTap(index: Int) -> Tap {
        let row = index / 4
        let col = index % 4
        let xCoord = Tap.tabXCoordinates[col]
        let yCoord = Tap.tabYCoordinates[row]
        let point = CGPoint(x: xCoord,y: yCoord);
        return Tap(location: point, parentView: imageView)
    }
    
    func resetImageView() {
        for tap in taps {
            tap.removeTap()
        }
        taps.removeAll()
        registeredTaps.removeAll()
    }
    
    // Search from pre defined fingerings.
    func findFingering(name: String) -> Fingering? {
        for fingering in Fingering.fingerings {
            if (fingering.name == name) {
                return fingering
            }
        }
        return nil
    }
    
    func registerTap(tap: Tap) {
        // Add tap to queue of tabs.
        taps.append(tap)
        // Update 2d array of registered taps.
        registeredTaps[tap.key] = true;
    }

}

