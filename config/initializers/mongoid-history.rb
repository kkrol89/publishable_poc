# # initializer for mongoid-history
# # assuming HistoryTracker is your tracker class
Mongoid::History.tracker_class_name = :history_tracker
Mongoid::History.modifier_class_name = "Locomotive::Account"
