#lib/c_notifier.rb
module C_notifier

  # def initialize
  #   @observers = []
  # end

  def add_observer(&observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.call(self) #update(self)
    end
  end

  def create(consultation)
    changed
    @consultations.push(consultation)
    notify_observers(Time.now)
  end

  def empty?
    @consultations.count.zero?
  end

end
