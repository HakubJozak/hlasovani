# Class that represents meeting status table
# id_point: int
# id_meeting: int
# id_print: int
# id_type: int
# point: int
# full_name: char(x)
# full_end: char(x)
# note: char(x)
# description: char(x)
# invitation: int
# rj: int
# note2: char(x)
# type_point: int
# id_sd: int
# shortcut: char(x)
class PointMeeting
  attr_accessor :id, :meeting, :print, :type, :point, :full_name,
                :full_end, :note, :description, :invitation, :rj, :note2,
                :type_point, :sd_document, :shortcut
end
