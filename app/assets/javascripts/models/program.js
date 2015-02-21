Scbt.Models.Program = Backbone.Model.extend({
  urlRoot: "api/programs",
  parse: function(res){
    if (res["enrollments"]){
      this.enrollments = new Scbt.Collections.Enrollments(res["enrollments"], {parse: true})
    }
    if (res["enrollment"]){
      this.enrollment = new Scbt.Models.Enrollment(res["enrollment"], {parse: true})
    }
    if (res["instructor"]){
      this.instructor = new Scbt.Models.User(res["instructor"])
    }
    if (res["instructors"]){
      this.instructors = new Scbt.Collections.Users(res["instructors"])
    }

    this.takenProgramSurvey = res["taken_program_survey"]
    this.takenInstructorSurvey = res["taken_instructor_survey"]
    // if (res["instructors"]){
    //   this.instructors = new Scbt.Collections.Users(res["instructors"])
    // }
    delete res["taken_program_survey"]
    delete res["taken_instructor_survey"]
    delete res["enrollment"]
    delete res["instructor"]
    delete res["enrollments"]
    delete res["instructors"]
    
    return res
  },

  instructorSurveyInstruction: function(){
    if (this.takenInstructorSurvey){
      return "Retake Instructor Survey"
    } else {
      return "Take Instructor Survey"
    }
  },

  programSurveyInstruction: function(){
    if (this.takenProgramSurvey){
      return "Retake Program Survey"
    } else {
      return "Take Program Survey"
    }
  }
})