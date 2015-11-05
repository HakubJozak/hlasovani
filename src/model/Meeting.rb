# Class that represents meeting table
# Model:
# id_meeting: int
# id_org: int
# meeting: int
# from_meeting: datetime (year to hour)
# to_meeting: datetime (year to hour)
# actualization: datetime (year to hour)
# invitation: int
class Meeting
  attr_accessor :id, :org, :meeting, :from_meeting, :to_meeting,
                :actualization, :invitation
end
