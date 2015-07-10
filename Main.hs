import System.Environment
import Data.Time
import Control.Applicative


type TaskTitle = String
type TaskDescription = String
type TaskCreationDate = ZonedTime
data Task = Task {  title :: TaskTitle
                    , description :: TaskDescription
                    , dateCreated :: TaskCreationDate
                 } deriving (Show)

newTask :: TaskTitle -> TaskDescription -> TaskCreationDate -> Task
newTask t d date = Task t d date

optionNew :: IO ()
optionNew = do putStrLn "New entry"

optionNewDescription = "Create new entry"

optionView :: IO ()
optionView = do putStrLn "View entries"
optionViewDescription = "View entries"

optionDelete :: IO ()
optionDelete = do putStrLn "Entry delete"
optionDeleteDescription = "Delete entry"

optionError :: IO ()
optionError = do error "Invalid Option"

optionList = [optionNew, optionView, optionDelete, optionError]
optionDescriptionList = [optionNewDescription, optionViewDescription, optionDeleteDescription]
optionNumbers = [1..]

options = zip3 optionNumbers optionDescriptionList optionList

getOptionNumber :: (Integer, String, IO () ) -> Integer
getOptionNumber (x, _, _) = x

getOptionDescription :: (Integer, String, IO () ) -> String
getOptionDescription (_, x, _) = x

getOptionFunction :: (Integer, String, IO () ) -> (IO ())
getOptionFunction (_, _, fn) = fn


printOptions :: IO ()
printOptions = do
    mapM_ (\(num, desc, _) -> putStrLn (line num desc )) options
    where line n desc = (show n) ++ ". " ++ desc


main = do
    c <- getZonedTime
    let x = newTask "Test" "This is a test description" c
    putStrLn (show x)
