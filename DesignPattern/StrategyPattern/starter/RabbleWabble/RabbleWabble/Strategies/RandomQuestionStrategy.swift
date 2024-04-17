import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: QuestionStrategyPattern {
  public var correctCount: Int = 0
  public var incorrectCount: Int = 0
  private let questionGroup: QuestionGroup
  private var questionIndex = 0
  private let questions: [Question]
  
  public init(questionGroup: QuestionGroup) {
    self.questionGroup = questionGroup
    let randomSource = GKRandomSource.sharedRandom()
    self.questions = RandomQuestionStrategy.shuffleAndConvertQuestions(using: randomSource, from: questionGroup.questions as [Any])
  }
  
  // MARK: - QuestionStrategy
  public var title: String {
    return questionGroup.title
  }
  
  public func currentQuestion() -> Question {
    return questions[questionIndex]
  }
  
  public func advanceToNextQuestion() -> Bool {
    guard questionIndex + 1 < questions.count else {
      return false
    }
    questionIndex += 1
    return true
  }
  
  public func markQuestionCorrect(_ question: Question) {
    correctCount += 1
  }
  
  public func markQuestionIncorrect(_ question: Question) {
    incorrectCount += 1
  }
  
  public func questionIndexTitle() -> String {
    return "\(questionIndex + 1)/\(questions.count)"
  }
  
  // MARK: - Helpers
  
  static func shuffleAndConvertQuestions(using randomSource: GKRandomSource, from questions: [Any]) -> [Question] {
    if let shuffledQuestions = randomSource.arrayByShufflingObjects(in: questions) as? [Any] {
      return shuffledQuestions.compactMap { $0 as? Question }
    } else {
      return []
    }
  }
  
}
