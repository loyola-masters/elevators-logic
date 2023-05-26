% Facts representing the elevators
elevator(elevator1).
elevator(elevator2).

% Facts representing the positions of the elevators
floor(elevator1, 4).  % Elevator 1 is initially at floor 4
floor(elevator2, 2).  % Elevator 2 is initially at floor 2

% Rules for determining the nearest elevator from the ground level
move(Elevator) :-
    elevator(Elevator),
    floor(Elevator, Position),
    Position >= 0, Position <= 8   % Ensures that elevators are in valid floors
    floor(_, OtherPosition), OtherPosition <= 8, OtherPosition >= Position).

% -------------------------
% Which elevator to select?
?- elevator(Elevator).
Elevator = elevator2.
