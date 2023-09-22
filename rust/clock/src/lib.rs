use std::fmt::{Display, Formatter, Result};

const MINUTES_PER_DAY: i32 = 24 * 60;
const MINUTES_PER_HOUR: i32 = 60;

#[derive(Debug, PartialEq, PartialOrd)]
pub struct Clock {
    minutes: i32,
}

impl Display for Clock {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        write!(
            f,
            "{:02}:{:02}",
            self.minutes / MINUTES_PER_HOUR,
            self.minutes % MINUTES_PER_HOUR
        )
    }
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            minutes: ((MINUTES_PER_HOUR * hours) + minutes).rem_euclid(MINUTES_PER_DAY),
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self {
            minutes: (self.minutes + minutes).rem_euclid(MINUTES_PER_DAY),
        }
    }

    pub fn get_hours(hours: i32, minutes: i32) -> i32 {
        let plus_hours: i32;
        if minutes >= 60 {
            plus_hours = minutes / 60;
        } else {
            plus_hours = 0;
        }

        let h = hours + plus_hours;
        if h >= 24 {
            if h < 47 {
                return h - 24;
            } else {
                return h / 24;
            }
        } else {
            return h;
        }
    }

    pub fn get_minutes(minutes: i32) -> i32 {
        if minutes >= 60 {
            return minutes % 60;
        } else {
            return minutes;
        }
    }
}
