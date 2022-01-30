//
//  MoodSurvey.swift
//  CardinalKit_Example
//
//  Created by Lina Fang on 23.01.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import ResearchKit
import Foundation

struct BudiSurvey {
    
    static let budiSurvey: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        // Q1
        let textChoiceQ1aAnswerFormat = ORKTextAnswerFormat.textAnswerFormat()
        let textStepQ1a = ORKQuestionStep(identifier: "Q1aQuestionStep", title: "Question #1", question: "What is your first name?", answer: textChoiceQ1aAnswerFormat)
        
        steps += [textStepQ1a]
        
        let textChoiceQ1bAnswerFormat = ORKTextAnswerFormat.textAnswerFormat()
        let textStepQ1b = ORKQuestionStep(identifier: "Q1bQuestionStep", title: "Question #1", question: "What is your last name?", answer: textChoiceQ1bAnswerFormat)
        
        steps += [textStepQ1b]
        
        // Q2
        let textChoiceQ2AnswerFormat = ORKDateAnswerFormat.dateAnswerFormat()
        let textStepQ2 = ORKQuestionStep(identifier: "Q2QuestionStep", title: "Question #2", question: "Please enter your birthday.", answer: textChoiceQ2AnswerFormat)
        
        steps += [textStepQ2]
        
        
        // Q3
        let textChoicesQ3 = [
        ORKTextChoice(text: "Before preschool", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Preschool", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Pre-k", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Kindergarten", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Grades 1-12", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Undergraduate", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Graduate", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Other", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
        ]
        let textChoiceQ3AnswerFormat = ORKAnswerFormat.valuePickerAnswerFormat(with: textChoicesQ3)
        let textStepQ3 = ORKQuestionStep(identifier: "Q3QuestionStep", title: "Question #3", question: "What grade are you in?", answer: textChoiceQ3AnswerFormat)
        
        steps += [textStepQ3]
        
        // Q4
        let textChoicesQ4 = [
        ORKTextChoice(text: "Yes", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "No", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "I don't know", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let textChoiceQ4AnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoicesQ4)
        let textStepQ4 = ORKQuestionStep(identifier: "Q4QuestionStep", title: "Question #4", question: "Do you have a diagnosis of cerebral palsy?", answer: textChoiceQ4AnswerFormat)
        
        steps += [textStepQ4]
        
        // Q5
        let textChoicesQ5 = [
        ORKTextChoice(text: "Spastic", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Dyskinetic", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Ataxic", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "I don't know", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let textChoiceQ5AnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: textChoicesQ5)
        let textStepQ5 = ORKQuestionStep(identifier: "Q5QuestionStep", title: "Question #5", question: "What type(s) of cerebral palsy do you have? (check all that apply)", answer: textChoiceQ5AnswerFormat)
        
        steps += [textStepQ5]
        
        // Q7
        let textChoicesQ7 = [
        ORKTextChoice(text: "Wheelchair", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Walker", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Orthotics", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let textChoiceQ7AnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: textChoicesQ7)
        let textStepQ7 = ORKQuestionStep(identifier: "Q7QuestionStep", title: "Question #7", question: "Do you use any assistive technology? (check all that apply)", answer: textChoiceQ7AnswerFormat)
        
        steps += [textStepQ7]
        
        // Q8
        
        let textChoicesQ8 = [
        ORKTextChoice(text: "Walking", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Taking the stairs", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Talking", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Eating & Swallowing", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Taking a shower", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Going to the bathroom", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Brushing my teeth", value: 6 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Texting & Using my phone", value: 7 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Sleeping", value: 8 as NSCoding & NSCopying & NSObjectProtocol)
        ]
        let textChoiceQ8AnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: textChoicesQ8)
        let textStepQ8 = ORKQuestionStep(identifier: "Q8QuestionStep", title: "Question #8", question: "What sorts of activities to you find difficult? (check all that apply)", answer: textChoiceQ8AnswerFormat)
        
        steps += [textStepQ8]
        
        // Summary
        
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you!"
        summaryStep.text = "We appreciate your time."
        
        steps += [summaryStep]
        
        return ORKOrderedTask(identifier: "MoodSurvey", steps: steps)
    
    }()
    
    
}
