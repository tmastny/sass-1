context('option errors')

test_that('unnamed options fail', {
  sass_options <- opts()
  names(sass_options) <- NULL
  expect_error(
    compile_sass(text = "foo { margin: 122px * .3; }", options = sass_options),
    "No named options"
  )
})

test_that('too few options fail', {
  sass_options <- opts()
  sass_options$precision <- NULL
  expect_error(
    compile_sass(text = "foo { margin: 122px * .3; }", options = sass_options),
    "missing"
  )
})

test_that('too many options fail', {
  sass_options <- opts()
  sass_options$new <- "hello"
  expect_error(
    compile_sass(text = "foo { margin: 122px * .3; }", options = sass_options),
    "unsupported"
  )
})

test_that('wrong options fail', {
  sass_options <- opts()
  sass_options$precision <- NULL
  sass_options$blah <- "hello"
  expect_error(
    compile_sass(text = "foo { margin: 122px * .3; }", options = sass_options),
    "precision"
  )
})

test_that('wrong type fails', {
  sass_options <- opts()
  sass_options$precision <- "hello"
  expect_error(
    compile_sass(text = "foo { margin: 122px * .3; }", options = sass_options),
    "Invalid type for precision"
  )
})

