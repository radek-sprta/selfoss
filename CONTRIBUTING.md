# Contributor's Guide

First of all, thank you for contributing to selfoss!

This document provides guidelines for contributing to the project. They are written to ensure its consistency and maintainability. All contributions are welcome, as long as you follow these guidelines. If you have any questions, please [contact me](incoming+radek-sprta/docker-selfoss@gitlab.com).

There are many ways to contribute to the project, including, but not limited to, submitting bug reports and feature requests, improving documentation or writing code.

## How to Report Bugs

Bug reports are hugely important, but please make sure to avoid duplicate reports. Before you submit one, please check [selfoss issues](https://gitlab.com/radek-sprta/docker-selfoss/issues), **both open and closed**, and make sure, that the bug has not been reported before.

When filing an issue, include answers to the following five questions:

1. What version of selfoss are you using?
1. What did you do?
1. What was the expected result?
1. What was the actual result?

## How to Suggest a Feature

If you have a suggestion for a feature or an enhancement, please feel free to [open an issue](https://gitlab.com/radek-sprta/docker-selfoss/issues). In your feature request, include the following:

1. What should the feature do?
1. Why do you need it?
1. How should it work?

Note that I reserve a right to reject a feature request, if I feel it does not align with the project's goals.

## Contributing Code

If this is your first time contributing code look at [How to create a merge request][mergetutorial]. After you read it, you follow this checklist to make a merge request:

1. Fork the repository.
1. Install pre-commit hooks via `pre-commit install`.
1. Add your feature.
1. Make a merge request.

### Code Style

- Write your commit message in the imperative: "Fix bug" and not "Fixed bug" or "Fixes bug." This convention matches up with commit messages generated by commands like git merge and git revert.

## Updating Documentation

If you have found any mistakes, want to add examples, or just improve the documentation in general, you are more than welcome! Just make your change and send a merge request.

## Closing Words

Thank you for taking the time to read the Contributor's Guide!

Radek Sprta

Maintainer

[mergetutorial]: https://docs.gitlab.com/ee/gitlab-basics/add-merge-request.html
