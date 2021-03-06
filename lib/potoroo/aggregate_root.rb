module Potoroo
  module AggregateRoot
    def self.included(base)
      base.include(Projection)
    end

    def initialize(aggregate_id, event_sink)
      @aggregate_id, @event_sink = aggregate_id, event_sink
    end

    private

    def emit(klass, payload = {})
      self << @event_sink.sink(klass, @aggregate_id, payload)
    end
  end
end
