#!/usr/bin/env bats

@test "ftpcloudfs binary is found in PATH" {
  run which ftpcloudfs
  [ "$status" -eq 0 ]
}