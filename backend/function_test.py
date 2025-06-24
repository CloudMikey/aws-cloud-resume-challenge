import unittest
from unittest.mock import patch
from function import lambda_handler  

class TestLambdaHandler(unittest.TestCase):
    @patch('function.table')
    def test_lambda_handler(self, mock_table):
        mock_table.get_item.return_value = {'Item': {'views': 0}}
        mock_table.put_item.return_value = {}
        result = lambda_handler({}, {})
        self.assertEqual(result, 1)

if __name__ == '__main__':
    unittest.main()
