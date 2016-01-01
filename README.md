# CodePath1Prework_TipCalculator
# Pre-work - *TipCalculator*

**TipCalculator** is a tip calculator application for iOS.

Submitted by: **Xinxin Xie**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Add a setting default backgroud color feature
- [X] Bill can be splitted

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://raw.githubusercontent.com/CindyXie/CodePath1Prework_TipCalculator/master/Demo2.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
Challenge 1: How to avoid duplication of code

Challenge 2: How to avoid putting everything into View Controller

Solution 1&2: By creating a new class, storage and retrieval actions are encapsulated inside a single model class, which eliminated repeated code, also improved the readability.

Challenge 3: How to update tip percentage in main view while default tip percentage changed in setting view.

Solution 3: Updating the UI everytime when navigating into the settings view and back by using "lifecyle" methods.


## License

    Copyright [2015] [Xinxin Xie]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
