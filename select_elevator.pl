% Facts representing the elevators
elevator(elevator1).
elevator(elevator2).

% Facts representing the positions of the elevators
floor(elevator1, 4).  % Elevator 1 is initially at floor 4
floor(elevator2, 2).  % Elevator 2 is initially at floor 2

% Rule for determining the nearest elevator from the ground level
move(Elevator) :-
    elevator(Elevator),
    floor(Elevator, Position),
    Position >= 0,  % Ensures that elevators below ground level are not considered
    \+ (floor(_, OtherPosition), OtherPosition >= 0, OtherPosition < Position).

% Rule to indicate an elevator is selected if it is at the ground level
use(Elevator) :-
    floor(Elevator, 0).
