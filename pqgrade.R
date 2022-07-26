pacman::p_load(tidyverse)

econ270<-"ignore/2022-02-20T0301_Grades-ECON-002-70.csv" %>% 
  read_csv() %>% select(1,3) %>% drop_na() %>% set_names("student","sis_id")


econ271<-"ignore/2022-02-20T0301_Grades-ECON-002-71.csv" %>% 
  read_csv() %>% select(1,3) %>% drop_na() %>% set_names("student","sis_id")
 

pgrades270<-econ270 %>% left_join("ignore/pquiz/P-Quiz 1 Quiz Student Analysis Report.csv" %>% 
  read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade1")) %>% 
  left_join("ignore/pquiz/P-Quiz 2 Quiz Student Analysis Report.csv" %>% 
                read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade2"))%>% 
  left_join("ignore/pquiz/P-Quiz 3 Quiz Student Analysis Report.csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade3"))%>% 
  left_join("ignore/pquiz/P-Quiz 4 Quiz Student Analysis Report.csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade4"))%>% 
  left_join("ignore/pquiz/P Quiz 5 Quiz Student Analysis Report.csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade5"))%>% 
  left_join("ignore/pquiz/P-Quiz 6 Quiz Student Analysis Report.csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade6"))%>% 
  left_join("ignore/pquiz/P-Quiz 7 Quiz Student Analysis Report.csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade7"))%>% 
  left_join("ignore/pquiz/P-Quiz 8 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,25) %>% set_names("sis_id","grade8") %>%
              mutate(grade8 = 0.5+0.5*grade8))%>% 
  left_join("ignore/pquiz/P-Quiz 9 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,23) %>% set_names("sis_id","grade9") %>% 
              mutate(grade9 = 0.5+0.5*grade9))%>% 
  left_join("ignore/pquiz/P Quiz 10 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,23) %>% set_names("sis_id","grade10") %>% 
              mutate(grade10 = 0.5+0.5*grade10))%>% 
  left_join("ignore/pquiz/P-Quiz 11 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,11) %>% set_names("sis_id","grade11") %>% 
              mutate(grade11 = 0.5+0.5*grade11)) %>%
  mutate_all(~replace_na(., 0)) %>% rowwise() %>%   mutate(total = sum(across(grade1:grade11)*100/11))

pgrades271<-econ271 %>% left_join("ignore/pquiz/P-Quiz 1 Quiz Student Analysis Report (1).csv" %>% 
                                    read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade1")) %>% 
  left_join("ignore/pquiz/P-Quiz 2 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade2"))%>% 
  left_join("ignore/pquiz/P-Quiz 3 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade3"))%>% 
  left_join("ignore/pquiz/P-Quiz 4 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade4"))%>% 
  left_join("ignore/pquiz/P Quiz 5 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade5"))%>% 
  left_join("ignore/pquiz/P-Quiz 6 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade6"))%>% 
  left_join("ignore/pquiz/P-Quiz 7 Quiz Student Analysis Report (1).csv" %>% 
              read_csv() %>% select(3,Grade)  %>% set_names("sis_id","grade7"))%>% 
  left_join("ignore/pquiz/P-Quiz 8 Quiz Student Analysis Report.csv" %>% 
              read_csv() %>% select(3,25) %>% set_names("sis_id","grade8") %>%
              mutate(grade8 = 0.5+0.5*grade8))%>% 
  left_join("ignore/pquiz/P-Quiz 9 Quiz Student Analysis Report.csv" %>% 
              read_csv() %>% select(3,23) %>% set_names("sis_id","grade9") %>% 
              mutate(grade9 = 0.5+0.5*grade9))%>% 
  left_join("ignore/pquiz/P Quiz 10 Quiz Student Analysis Report.csv" %>% 
              read_csv() %>% select(3,23) %>% set_names("sis_id","grade10") %>% 
              mutate(grade10 = 0.5+0.5*grade10))%>% 
  left_join("ignore/pquiz/P-Quiz 11 Quiz Student Analysis Report.csv" %>% 
              read_csv() %>% select(3,11) %>% set_names("sis_id","grade11") %>% 
              mutate(grade11 = 0.5+0.5*grade11)) %>%
  mutate_all(~replace_na(., 0)) %>% rowwise() %>%   mutate(total = sum(across(grade1:grade11)*100/11))

pgrades270 %>% write_csv("ignore/pquiz/grades70.csv")
pgrades271 %>% write_csv("ignore/pquiz/grades71.csv")


advisorygrades
