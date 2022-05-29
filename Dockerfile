FROM python
RUN pip install -U pip
RUN pip install --no-cache-dir boto3
RUN pip install --no-cache-dir awscli
RUN pip install --no-cache-dir tweepy
RUN pip install --no-cache-dir datetime


    #get your AWS Access keys: https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html
ENV AWS_Access_Key_ID="AKIAT5HKXVAXBBSYBQ7T"\
    AWS_Secret_Access_Key="MMYthmFm+UZhD0XiSasUZ421tAEGp4Gy26FJ3eo4"\
    #get your Twitter API Key and Secret https://developer.twitter.com/en/apply-for-access
    consumer_key="b53pTr9eEiukVUv84tT9yZ9Pe"\
    consumer_secret="x7HEOPuo6D2eEN1MEKFglry0iHBZkPw8HW0OY849qp0yePskTT"\
    # get your Twitter Access Token and Secret https://developer.twitter.com/en/apply-for-access
    access_token="1370801789432385544-q4FrbctXI4XOpMhJknOj7MsVB0BmDR"\
    access_token_secret="mwTx2nuwj7l3R8MtTgU3KbUxyCoqEZPyStYgfdVTG3eYt"\
    #AWS bucket name
    bucket="snowflake-bucket-123"\
    # specify your own default twitter keyword here. 
    keyword="elonmusk"

ENV PYTHONUNBUFFERED=1

COPY ./twitter_local.py .
COPY ./twitter_local.sh .

RUN aws configure set aws_access_key_id $AWS_Access_Key_ID
RUN aws configure set aws_secret_access_key $AWS_Secret_Access_Key
RUN ["chmod","+x","/twitter_local.sh"]
ENTRYPOINT ["/bin/sh","/twitter_local.sh"]
