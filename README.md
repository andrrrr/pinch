# pinch

Project uses pods dependency management, so "pod install --repo-update" is needed from directory where pofile is located. 
Test target has a cuckoo script in Build Phases - it generates mocks for objects listed in the script on each test target run.

**Some design considerations:**

Main pattern used is MVVM + Coordinator. Each view element has view, view model, and view model type (protocol). Delegate pattern is used for communication between elements. Unidirectional data flow is important - so view controller has strong reference to viewModel, while view model doesn't have knowledge about view (it does have weak view delegate for backwards communication). 

**Storyboards:**
Protocol "Storyboarded" is used for simplified view initialization from storyboard. Each view controller inside storyboard has to have same ID as class name for that ViewController.swift.
Main storyboard is "Games", but if the project grows further there would be more different storyboards - each per scene, hence the enum for storyboard names (with one element). Scenes inside storyboard do not have connections/segues, because coordinator is in control of the flow.

**Coordinators:**
Coordinator is used for navigation flow. This way your views/viewModels do not have to have knowledge about neighboring views once transition is needed. 
Also this removes configuration logic from view models. 
Main coordinator is used for starting of the app and initializing children coordinators. Main coordinator has reference to it's children and can be used to do full dismiss-to-route.

**Cells:**
Protocol CellConfigurable is used for table cells. This removes cells UI configuration logic from the view controller possessing the table view (table delegate). Also CellViewModel is used (RowViewModel protocol), which slightly differs from classical cells-MVVM implementation: in my case RowViewModel is an enum with associated value in it, which is a CellViewModel. Reason for that is that after using it for a while I realised that to make cells equatable on generic level I could not use protocol anymore (protocols can not conform to protocols). Use case for equatable on cells is when you need dynamic table updates (delete, insert, refresh) - when calculating delta you'd need to differ between cells.

**Dependency graph:**
A Dependency graph is used for shared objects. It assures single state shared objects/services, as well as retain cycles (service A has reference to service B, while service B has reference to service A). Also this allows for simple dependency injection during unit testing.

**Cuckoo mocking framework:**
Is used for mocking of the objects. In test target scripts there's a script for generating mocks. Mocks are in GeneratedMocks.swift.  

**Quick:**
Is a testing framework for short and self-explanatory test notations.

**Nimble:**
Is a framework allowing screenshot testing. It's a tool for verification of the views whenever any changes are made (combined with mock-data). Initially 
screenshots are made of the views that are needed to be tested. These reference images are to be found in ReferenceImages inside test folder (it's not not visible from xcode, but it is in the git repo and part of the project). When UI test is run on simulator on remote build machine - it compares newly taken screenshots with reference images - and if difference is detected (up to 1px) - test will fail.
Important: iPhone 14 Max Pro with iOS16 simulator should be used for screenshots verification. This can be configured on build pipeline.
Disclaimer: I found that verifying screenshots doesn't work on different Mac chips. Although same simulator+iOS is selected, different chip/MacOS can cause slight difference in appearance (rounded corners with different radius) - that will fail the test. Easy to workaround - in NimbleSnapshotHelper - set 
let snapshotAction = .recordSnapshot, run test target once (it will fail, but record new snapshots) - after that change back to .verifySnapshots - it will work after that. 

**Git LFS (large file system) for screenshots:**
Should be used for ReferenceImages folder because over time this folder becomes a few GB, and checking out the repo by new developer could take ages. 

**What could be improved:**
I did not use CoreData as it appears a bit of a learning curve to marry Codable with NSManagedObject (especially with nested objects: Game > Cover, Game > Screenshots) and I only had 2 days on the weekend. I did however implement offline state persistence workaround by using FileManager. This is only for quick workaround purpose and I would not use this in actual project: read/write can be slow, and there can be issues with absolute url path creation. 
Using CoreData is best way to achive cache layer. There was a way to write a full jsonString inside CoreData and then use that to costruct back the objects array, but there is advice against doing that. 

I coulnd't dedicate much time to make the detail view properly. Ideally it should also be a scrollable table view with cells being dynamically added if there is content for them (some are missing image, some fields are missing etc.).


