# frozen_string_literal: true

class GraphqlChannel < ApplicationCable::Channel
  def execute(data)
    result = 
      MySchema.execute(
        query: data["query"],
        context: context,
        variables: Hash(data["variables"]),
        operation_name: data["operationName"],
      )

    transmit(
      result: result.subscription? ? { data: nil } : result.to_h,
      more: result.subscription?,
    )
  end

  def unsubscribed
    MySchema.subscriptions.delete_channel_subscriptions(self)
  end

  private

  def context
    {
      account_id: account&.id,
      channel: self,
    }
  end
end