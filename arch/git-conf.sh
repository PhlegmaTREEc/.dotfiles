#!/usr/bin/env bash
echo -n "Enter ename: "
read name
echo -n "Enter email: "
read mail

git config --global user.name "$name"
git config --global user.email "$mail"
