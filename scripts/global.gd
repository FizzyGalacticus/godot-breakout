extends Node

const BASE_POINTS = 5

var playerPoints = 0
var numberOfBricks = 0

func increasePlayerPoints():
	playerPoints += BASE_POINTS

func increasePlayerPointsWithMultiplier(multiplier):
	playerPoints += BASE_POINTS * multiplier

func incrementBricks():
	numberOfBricks += 1

func decrementBricks():
	numberOfBricks -= 1
