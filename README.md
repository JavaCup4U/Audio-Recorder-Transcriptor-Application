# Audio-Recorder-Transcriptor-Application
Audio Recorder Transcriptor is a mobile application that allows users to record audio that they may need for productivity, notes, lectures and be able to transcribe it into text for reuse later. 
Audio Recorder Application - README

# Audio Recorder Transcriptor

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
- Building a iOS recorder application 
- This application can handle real world scenarios in audio challenges
- Integrates with backend transcription services. 
- Manages large data efficiently with SwiftData. 


### Description
- Audio Recorder Transcriptor is an application that can capture recording audio.
- Transcribes audio in 30 second segments.



## Core Requirement Goals 
1. Audio System
    * Audio Session Management : Set up session with appropriate categories and options.
    * Route Change Handling and Audio Interruption Recovery: Handle changes in audio routes, headphones plugged/unplugged, bluetooth. Notifications, phone calls, and interruptions with automatic recovery afterwards. 
    * Background Recording: Allow application to continue recording when in the background. 
    * Recording Quality: Ability to select audio settings such as sample rate, bit depth, formating.
    * Real-time Audio Monitoring: Option for real-time audio level control and visualization.


2.Timed Backend Transcription 
* Automatic Segmentation: Split recordings into segments with default of 30 seconds. 
* API Integration: Transfer audio to a transcription endpoint.
* Retry Logic: Implement exponential backoff for failed transcription requests.
* Concurrent Processing: Handle multiple transcription requests in an efficient manner. 
* Offline Queuing: Queue segments for transcription when network is unavailable.
* Fallback to local models: If the transcription fails consecutively for more than 5+ times, fallback to local speech to text models, i.e. apple transcription service/ local whisper model.


3. SwiftData Integration
* Data Model Requirements : 
    * Recording Session and Transcription segments: Store transcription text, processing metadata.
    * Relationships: Proper relationships between sessions, segments, and trancriptions.
    * Performance: Optimize for datasets of 1000+ sessions and 10,000+ segments

4. User Interface & Experience 
* UI Requirements:
    *Recording Controls: Start/Stop/Pause recording with visual feedback
    *Session List: Efficient list displaying sessions grouped by date with search/filter
    *Session Detail: Show segments with transcription status and text.
    *Real-time Updates: Live updates during recording and transcription.
    *Performance: Smooth scrolling with large datasets using proper list virtualization.
    *Accessibility: Full VoiceOver support and accessibility labels.
    
*Design Suggestions/Considerations 
    *Handle loading states 
    * Implement pull-to-refresh and pagination 
    *Show transcription progress indicators 
    *Provide offline/online status indicators 
    
    


### 2. Screen Archetypes

-  Home Screen
    *Contains option to capture audio recording with start /stop buttons 
    *Lists and displays all past captures 
    *Allow to show detail for every session capture 
    *Search filter option on screen 
- Detail Screen 
    *Displays details of the audio recording such as date time and the transcripted text.
    
    


## Wireframes

![AudioRecorderTranscriptor](https://github.com/user-attachments/assets/2c009f16-eff4-4ccb-a811-8ac0d06ccda3)






### Networking

-Api for transcription will make use of Openai's Whisper. 
