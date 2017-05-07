#HAndle calls - 3 types of employees. Escalate to next level in case an employee can't handle
class Employee
  FRESHER = 0
  TECH_LEAD = 1
  PM = 2
  HIGHEST_LEVEL = 2

  attr_accessor :name, :level, :status

  def initialize(name, level)
    @level = level
    @name = name
    @status = :free
  end

  def escalate(call)
    call.escalateToNextLevel
  end

  def handleCall(call)
    return unless @status == :free
 
    call.start_call
    @status = :on_call
    sleep 10
    endCall(call)
  end

  def endCall(call)
    call.end_call
    @status = :free
  end
end

class Call
  attr_accessor :level, :start_time, :end_time, :status

  def initialize()
    @level = Employee::FRESHER
    @status = :waiting
  end

  def escalateToNextLevel
    return if @level == Employee::HIGHEST_LEVEL
    @level += 1
  end

  def start_call
    @start_time = Time.now
    @status = :on_call
  end
  
  def end_call
    @end_time = Time.now
    @status = :ended
  end
end

class TechLead < Employee
  def initalize(name)
    super(name, TECH_LEAD)
  end
end
 
class Fresher < Employee
  def initalize(name)
    super(name, FRESHER)
  end
end

class PM < Employee
  def initalize(name)
    super(name, PM)
  end
end

class CallHandler
  attr_accessor :num_levels
  attr_accessor :employees #Array of lists for each levels
  attr_accessor :calls_queue # Different queues for each level
 
  def initialize()
    @num_levels = 3
    @calls_queue = Array.new(@num_levels) { Queue.new }
    @employees = Array.new(@num_levels)
  end

  def add_employee(employee)
    @employees[employee.level-1] = employee
  end

  def remove_employee(employee)
    @employees[employee.level].delete(employee)
  end

  def getFreeEmployee(level)
    for level in level..Employee::HIGHEST_LEVEL
      @employees[level].each do |emp|
        if emp.free
          return emp
        end 
      end
    end
  end

  def handleCall(call)
    raise "Cannot handle call" if (call.level > Employee::HIGHEST_LEVEL)
    if !@calls_queue[call.leve].empty
      #Put the call to queue
      @calls_queue.enqueue(call)
      return
    end
    emp = getFreeEmployee(call.level)
    if emp
      emp.handleCall(call)
    else
      @calls_queue[call.level].enqueue(call)
    end
  end

  def handleWaitingCalls
    return if @calls_queue.empty?
    for level in 0..Employee::HIGHEST_LEVEL #Do reverse based on priority
      if (!@calls[level].empty?)
        emp = getFreeEmployee(level)
        if emp
          emp.handleCall(@calls[level].dequeue)
        end
      end
    end
  end
end

