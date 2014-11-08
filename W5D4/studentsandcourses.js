function Student(first, last) {
  this.first = first;
  this.last = last;
  this.courses = [];
}

Student.prototype.name = function() {
  return this.first + " " + this.last;
};

Student.prototype.enroll = function(course) {
  if (course.enrolledStudents.indexOf(this) === -1) {
    course.addStudent(this);
  }
};

Student.prototype.courseLoad = function() {
	var load = {}
	
	for (var i = 0; i < this.courses.length; i++) {
		var dep = load[this.courses[i].department];
		if (dep === undefined) {
			dep = this.courses[i].credits;
			console.log(dep);
		} else {
			(dep += this.courses[i].credits);
			console.log(dep);
		}
	}
	console.log(load);
};

function Course(courseName, department, credits) {
  this.courseName = courseName;
  this.department = department;
  this.credits = credits;
  this.enrolledStudents = [];
}



Course.prototype.addStudent = function(student) {
  this.enrolledStudents.push(student);
  student.courses.push(this);
};

jonny = new Student("jonny", "wauhkonen");

aa = new Course("app academy", "compsci", "800");
ca = new Course("code academy", "compsci", "400");
ned = new Course("Ned's lectures", "compsci", "2000");
guitar = new Course("guitar", "music", "20");

jonny.enroll(aa);
jonny.enroll(ca);
jonny.enroll(ned);
jonny.enroll(guitar);

console.log(jonny.courses);
jonny.courseLoad();


