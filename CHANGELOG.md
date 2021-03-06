# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [Unreleased]
## [0.3.1] - 2020-10-15
### Changed
- OSU to use the new 2020 modules [#48](https://github.com/OSC/frame-renderer/pull/48).

### Fixed
- Fixed a bug with bind directories in the singularity command [#48](https://github.com/OSC/frame-renderer/pull/48).

## [0.3.0] - 2020-08-25
### Added
- Added the ability to load the Kent State modules based on group membership

### Changed
- Changed the way other sites can configure different things like cores, cluster
  and the script to be submitted.  Sites can now simply use environment varaibles
  instead of ruby initializers.

## [0.2.3] - 2020-04-07
### Fixed
- Another framing bug when users specify just one node [#41](https://github.com/OSC/frame-renderer/pull/40)
  the start and end frames were not corrrect.

## [0.2.2] - 2020-04-06
### Fixed
- Endframe was not being cacluated correctly when the start frame was non-zero. So end
  endframe is now `offset + start frame [+ remainder if last task]` 
  ([#40](https://github.com/OSC/frame-renderer/pull/40)).
- +1 offset was incorrect and only needs to be applied to start frame if the pbs
  id is > 1.

## [0.2.1] - 2020-04-03
### Fixed
- wall_time was not being submitted.
- new projects need to validate the name exists [#37](https://github.com/OSC/frame-renderer/issues/37)
- generating and showing thumbnails expected file extension to be .exr only.

## [0.2.0] - 2019-10-18
### Added
- added SFTP links to support [#3](https://github.com/OSC/frame-renderer/issues/3)

## [0.1.1] - 2019-09-26
### Fixed
- ensure app doesn't crash if there is no `~/maya/projects` directory [#30](https://github.com/OSC/frame-renderer/issues/30)

[Unreleased]: https://github.com/OSC/frame-renderer/compare/0.3.1...HEAD
[0.3.1]: https://github.com/OSC/frame-renderer/compare/0.3.0...0.3.1
[0.3.0]: https://github.com/OSC/frame-renderer/compare/0.2.2...0.3.0
[0.2.2]: https://github.com/OSC/frame-renderer/compare/0.2.1...0.2.2
[0.2.1]: https://github.com/OSC/frame-renderer/compare/0.2.0...0.2.1
[0.2.0]: https://github.com/OSC/frame-renderer/compare/0.1.1...0.2.0
[0.1.1]: https://github.com/OSC/frame-renderer/compare/0.1.0...0.1.1
