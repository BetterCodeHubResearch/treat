# Defines a question to answer in the
# context of a classification problem.
class Treat::Learning::Question
  
  # Defines an arbitrary label for the
  # question we are trying to answer 
  # (e.g. is_key_sentence), which will
  # also be used as the annotation name
  # for the answer to the question.
  attr_reader :name
  # Defines the target of the question
  # (e.g. :sentence, :paragraph, etc.)
  attr_reader :target
  # Can be :continuous or :discrete,
  # depending on the features used.
  attr_reader :type
  # Default for the answer to the question.
  attr_reader :default
  
  # Initialize the question.
  def initialize(name, target, default = nil, type = :continuous)
    unless name.is_a?(Symbol)
      raise Treat::Exception, 
      "Question name should be a symbol."
    end
    unless Treat.core.entities.list.include?(target)
      raise Treat::Exception, "Target type should be " +
      "a symbol and should be one of the following: " +
      Treat.core.entities.list.inspect
    end
    unless [:continuous, :discrete].include?(type)
      raise Treat::Exception, "Type should be " +
      "continuous or discrete."
    end
    @name, @target, @type, @default = 
     name,  target,  type,  default
  end

  # Custom comparison operator for questions.
  def ==(question)
    @name == question.name &&
    @type == question.type &&
    @target == question.target &&
    @default == question.default
  end
  
end