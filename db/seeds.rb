Arrival.create!([
  {train_id: 1, platform: 2},
  {train_id: 6, platform: 2},
  {train_id: 20, platform: 3}
])
Train.create!([
  {arrives_at: "2000-01-01 06:36:00", line: "N"},
  {arrives_at: "2000-01-01 06:51:00", line: "NW"},
  {arrives_at: "2000-01-01 07:07:00", line: "N"},
  {arrives_at: "2000-01-01 07:11:00", line: "NW"},
  {arrives_at: "2000-01-01 07:19:00", line: "N"},
  {arrives_at: "2000-01-01 07:26:00", line: "NW"},
  {arrives_at: "2000-01-01 07:30:00", line: "NW"},
  {arrives_at: "2000-01-01 07:34:00", line: "N"},
  {arrives_at: "2000-01-01 07:44:00", line: "NW"},
  {arrives_at: "2000-01-01 07:45:00", line: "NW"},
  {arrives_at: "2000-01-01 07:50:00", line: "NW"},
  {arrives_at: "2000-01-01 07:51:00", line: "N"},
  {arrives_at: "2000-01-01 08:02:00", line: "N"},
  {arrives_at: "2000-01-01 08:08:00", line: "N"},
  {arrives_at: "2000-01-01 08:16:00", line: "N"},
  {arrives_at: "2000-01-01 08:20:00", line: "NW"},
  {arrives_at: "2000-01-01 08:25:00", line: "N"},
  {arrives_at: "2000-01-01 08:31:00", line: "N"},
  {arrives_at: "2000-01-01 08:38:00", line: "N"},
  {arrives_at: "2000-01-01 08:41:00", line: "NW"},
  {arrives_at: "2000-01-01 08:44:00", line: "NW"},
  {arrives_at: "2000-01-01 08:57:00", line: "N"},
  {arrives_at: "2000-01-01 09:06:00", line: "N"},
  {arrives_at: "2000-01-01 09:12:00", line: "NW"},
  {arrives_at: "2000-01-01 09:46:00", line: "N"}
])
